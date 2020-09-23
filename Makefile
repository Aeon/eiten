.PHONY: clean-dangling-images build run

-include .env

clean-dangling-images:
	@docker rmi -f $$(docker images -f 'dangling=true' -q)

build:
	@docker build -t tradytics-eiten:0.0.2 .
	@make -s clean-dangling-images

run:
	@docker run --rm -it \
		-v $(PWD)/__output:/app/output \
		--name tradytics-eiten \
	tradytics-eiten:0.0.2 python3 portfolio_manager.py \
		--is_test 1 \
		--future_bars 90 \
		--data_granularity_minutes 3600 \
		--history_to_use all \
		--apply_noise_filtering 1 \
		--market_index QQQ \
		--only_long 1 \
		--eigen_portfolio_number 3 \
		--stocks_file_path stocks/stocks.txt
