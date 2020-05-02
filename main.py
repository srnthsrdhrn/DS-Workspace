import signal
import subprocess
import sys
import time
import json

CHECK_TIMER = 10
PACKAGES = (
    'daemonize',  # Used to daemonize a process in ubuntu
)


def read_config(file_path="config.json"):
    config = json.load(open(file_path))
    return config


def receive_signal(signalNumber, frame):
    if signalNumber == signal.SIGTERM:
        print("Received SIGTERM. Container about to terminate. Executing backup operations")
        sys.exit()


def run_command(cmd):
    if type(cmd) == str:
        cmd = cmd.split(" ")
    elif type(cmd) == list:
        pass
    process = subprocess.Popen(cmd,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout, stderr


def update_ubuntu_packages():
    print("Updating Ubuntu")
    run_command(['apt-get', '-y', 'update'])


def install_ubuntu_packages(packages=PACKAGES):
    print('Installing Ubuntu Packages')
    run_command(['apt-get', 'install', '-y', packages])


def start_process():
    print("Initializing Monitor")
    config = read_config()
    if config.get("use_jupyter", False):
        print("Starting Jupyter Lab")
        run_command('jupyter lab &')


if __name__ == '__main__':
    # Registering callback
    signal.signal(signal.SIGTERM, receive_signal)
    start_process()
    # Loop to keep the process active.
    while True:
        print("Docker Monitor Active Ping")
        time.sleep(CHECK_TIMER)
