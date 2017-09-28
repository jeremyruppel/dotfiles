# iterm2

Configuring the best shell in the world!

#### smart selection for JIRA tickets

1. Go to `Preferences` → `Profiles` → `Advanced` → `Smart Selection` → `Edit`
1. Add a new rule to match `\b[A-Z]+-\d+\b` with High priority
1. Click on `Edit Actions...` and add an action to open the URL to your JIRA instance, using `\0` to match the ticket ID
