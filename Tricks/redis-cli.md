# Redis Documentation

## Overview
Redis is an open-source, in-memory data structure store widely used as a database, cache, and message broker. It supports multiple data structures, including strings, hashes, lists, sets, sorted sets, bitmaps, and more. Redis is designed for high performance, scalability, and simplicity.

## Key Features
- **High Performance:** Sub-millisecond latency and high throughput.
- **Data Persistence:** Supports snapshots and append-only file (AOF) persistence.
- **Scalability:** Provides clustering and replication for scalability and availability.
- **Versatile Data Structures:** Strings, lists, hashes, sets, and sorted sets.
- **Pub/Sub Messaging:** Efficient messaging system for real-time communication.
- **Scripting:** Built-in Lua scripting for complex operations.

## Common Use Cases
1. **Caching:** Store frequently accessed data to reduce database load.
2. **Session Storage:** Manage user sessions efficiently.
3. **Real-time Analytics:** Track and analyze real-time data streams.
4. **Message Queues:** Enable reliable, low-latency messaging.
5. **Leaderboards:** Maintain sorted lists for ranking applications.

## Redis CLI Commands

### General Commands
- `ping`: Test connectivity to the Redis server.
- `info`: Display server information and statistics.
- `exists <key>`: Check if a key exists.
- `del <key>`: Delete a key.

### String Commands
- `set <key> <value>`: Set a value for a key.
- `get <key>`: Retrieve the value of a key.
- `SELECT <database-number>` Switching Databases in Redis

