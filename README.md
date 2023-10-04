# Dynamic Nginx Lua Load Balancer

Leverage [OpenResty](https://github.com/openresty/docker-openresty/blob/master/alpine/Dockerfile) to craft a dynamic load balancer with Lua, allowing requests to be routed based on their payloads.

## 📖 Overview

OpenResty provides a powerful integration with Lua scripting, enabling unique ways to manipulate HTTP traffic. This project harnesses that power to inspect request payloads and intelligently decide the routing destination. The main goal is to create a dynamic, flexible, and context-aware load balancing mechanism.

### Flow of Operations:

1. **Inspecting the Request**: The [access_by_lua_block](https://github.com/openresty/lua-nginx-module#access_by_lua_block) directive is utilized to extract the request body. Once obtained, it's stored in [ngx.ctx](https://github.com/openresty/lua-nginx-module#ngxctx) under the `body_data` key as a string.

2. **Determining the Destination**: The [balancer_by_lua_block](https://github.com/openresty/lua-nginx-module#balancer_by_lua_block) directive accesses the stored `body_data`. Using [cjson](https://www.kyne.com.au/~mark/software/lua-cjson.php) to parse the string to JSON, it identifies the appropriate host (based on the `host` key) and routes the request accordingly.

## ⚙️ Configuration

**Environment Variables**:
- `SERVER_A`: Internal URL for one of the potential routing destinations.
- `SERVER_B`: Internal URL for another potential routing destination.

These variables help configure and differentiate the target endpoints, giving the load balancer its choices of servers to route traffic to. It can be adapted to multiple servers, this repository servers as a proof-of-concept only.

## 🚀 Setup & Run

1. Clone this repository and navigate to its directory.
1. `cp docker-compose.override.example.yml docker-compose.override.yml`.
1. `cp .env.sample .env`.
1. Set the required environment variables `SERVER_A` and `SERVER_B` accordingly.
1. `docker-compose up`, your service will be available at `http://localhost:3000`.

## 🤝 Contributions

Improvements, bug fixes, and optimizations are always welcome! If you're looking to contribute, please fork the repository and submit a pull request.
