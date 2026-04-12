import json
conf = open('conf/packer/docker.json', 'r')
version = json.loads(conf.read())['version']

def test_version_via_default(host):
    cmd = host.run_expect([0], 'docker run cliffano/minecraft-npc --version')
    assert cmd.stdout == '0.10.0\n'

def test_help_via_default(host):
    cmd = host.run_expect([0], 'docker run cliffano/minecraft-npc --help')
    assert 'Usage: minecraft-npc [options] [command]' in cmd.stdout

def test_version_via_latest_tag(host):
    cmd = host.run_expect([0], 'docker run cliffano/minecraft-npc:latest --version')
    assert cmd.stdout == '0.10.0\n'

def test_help_via_latest_tag(host):
    cmd = host.run_expect([0], 'docker run cliffano/minecraft-npc:latest --help')
    assert 'Usage: minecraft-npc [options] [command]' in cmd.stdout

def test_version_via_version_tag(host):
    cmd = host.run_expect([0], f'docker run cliffano/minecraft-npc:{version} --version')
    assert cmd.stdout == '0.10.0\n'

def test_help_via_version_tag(host):
    cmd = host.run_expect([0], f'docker run cliffano/minecraft-npc:{version} --help')
    assert 'Usage: minecraft-npc [options] [command]' in cmd.stdout
