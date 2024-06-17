import logging

def configure_logging(log_file):
    logging.basicConfig(filename=log_file, level=logging.INFO)
    logging.info("log file created!")