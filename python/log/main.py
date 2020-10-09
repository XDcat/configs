# -*- coding:utf-8 -*-
"""
__author__ = 'XD'
__mtime__ = 2020/10/8
__project__ = configs
Fix the Problem, Not the Blame.
"""


def use_py():
    from python.log import logconfig
    import logging
    logconfig.setup_logging()
    log = logging.getLogger(__name__)
    log.debug("This is a debug")


def use_py_with_yaml():
    from python.log import logconfig
    import logging
    logconfig.setup_logging(default_log_config="logconfig.yaml")
    log = logging.getLogger(__name__)
    log.debug("This is a debug")


def use_yaml():
    import yaml
    import logging
    import logging.config
    with open("logconfig.yaml", encoding="utf8") as f:
        conf = yaml.load(f, yaml.FullLoader)
    logging.config.dictConfig(conf)
    log = logging.getLogger(__name__)
    log.debug("This is a debug")


if __name__ == '__main__':
    # use_py()
    use_py_with_yaml()
    # use_yamlk()