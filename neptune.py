import neptune

run = neptune.init_run(
    api_token=os.getenv("NEPTUNE_API_TOKEN"),
    project="marcpires--dsa/car-price-prediction",
)


PARAMS = {
    "batch_size": 64,
    "dropout": 0.2,
    "learning_rate": 0.001,
    "optimizer": "Adam",
}

run["parameters"] = PARAMS
