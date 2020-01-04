
# Docker SSH tunnel

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/symfonydoge/docker-ssh-tunnel)
![Docker Pulls](https://img.shields.io/docker/pulls/symfonydoge/docker-ssh-tunnel)
![Docker Stars](https://img.shields.io/docker/stars/symfonydoge/docker-ssh-tunnel)

This docker image can be used in case when you need
an access, for example, to some service on your production server,
which doesn't expose it's ports to the worldwide.
Additionally, you don't want to touch ports on your local machine,
because some of them can be busy or just reserved.

## Usage

### docker run

### docker-compose.yml

The minimal configuration will look like:

```
services:
    ssh-tunnel-example:
        image: symfonydoge/docker-ssh-tunnel:latest
        volumes:
            - $HOME/.ssh/id_rsa:/root/ssh-import/id_rsa:ro
        environment:
            SSH_TUNNEL_HOST: corp.domain.ltd
            REMOTE_PORT: 6379
```

where `$HOME/.ssh/id_rsa` is a path to your private SSH key,
`corp.domain.ltd` is a domain or IP address of your server
and `6379` is the remote port to forward
(local port will be the same if not specified explicitly, 
see full list of environment variables below).

Now each container in the compose project can access
tunnelled resource through `ssh-tunnel-example:6379`.

## Environment Variables

| Name              | Default value | Description                                                                       |
| :---------------- | :------------ | :-------------------------------------------------------------------------------- |
| `LOCAL_HOST`      | *             | IP address or domain to present remote resource in the tunnel container           |
| `LOCAL_PORT`      | equal to `REMOTE_PORT` | Port number to present remote resource in the tunnel container           |
| `REMOTE_HOST`     | 127.0.0.1     | IP address or domain of resource on the remote server by which it can be accessed |
| `REMOTE_PORT`     |               | Port number of resource on the remote server by which it can be accessed          |
| `SSH_TUNNEL_HOST` |               | Host of the remote server to create an SSH tunnel                                 |
| `SSH_TUNNEL_PORT` | 22            | SSH daemon port on the remote server                                              |
| `SSH_TUNNEL_USER` | root          | User login for establishing an SSH connection                                     |

## Hints

- You can expose a port only for local access
in your docker-compose project, just specify localhost
in the mapping: `127.0.0.1:6379:6379`. See [documentation](https://docs.docker.com/config/containers/container-networking/).

## Changelog
All notable changes to this project will be documented in [CHANGELOG.md](CHANGELOG.md).