# User Management Script

This script manages Linux system users: adding, deleting, listing, and
resetting passwords.

## Usage
```bash
./scripts/user_management.sh add <username>
./scripts/user_management.sh delete <username>
./scripts/user_management.sh list
./scripts/user_management.sh reset-password <username>
```

## Notes
- Requires sudo privileges.
- `delete` removes the user's home directory as well (`-r` flag).
