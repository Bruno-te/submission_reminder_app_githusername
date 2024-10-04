#!/bin/bash
mkdir -p submission_reminder_app/{app,modules,assets,config}

touch submission_reminder_app/app/reminder.sh
touch submission_reminder_app/modules/functions.sh
touch submission_reminder_app/config/config.env
touch submission_reminder_app/assets/submissions.txt
touch submission_reminder_app/startup.sh

echo "days remaining=2"> submission_reminder_app/config/config.env

#!/bin/bash
source submission_reminder_app/config/config.env
source submission_reminder_app/modules/functions.sh
submissions_file=".submission_reminder_app/assets/submissions.txt"

echo "Assignment: $ASSIGNMENT" >submission_reminder_app/app/reminder.sh

#!/bin/bash
function check_submissions {
local submissions_file=$1

echo "Checking submissions in $submissions_file"

while IFS=, read -r student assignment status; do
student=$(echo "$student" | xargs)
assignment=$(echo "$assignment" | xargs)
status=$(echo "$status" | xargs)

if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

echo "Application environment setup complete!"
echo "student, assignment, submission status" >submission_reminder_app/assets/submissions.txt
echo "here, Shell Navigation, submitted" > submission_reminder_app/assets/submissions.txt
echo "Noel, Shell Navigation, not submitted"> submission_reminder_app/assets/submissions.txt
echo "bruno, shell Navigation, submitted" > submission_reminder_app/assets/submissions.txt
echo "arnold, shell Navigation, not submitted" > submission_reminder_app/assets/submissions.txt
echo "sam, shell Navigation, not submitted" > submission_reminder_app/assets/submissions.txt
echo "clark, shell Navigation, submitted" > submission_reminder_app/assets/submissions.txt
echo "erica, shell Navigation, submitted" > submission_reminder_app/assets/submissions.txt

chmod +x submission_reminder_app/app/reminder.sh
chmod +x submission_reminder_app/modules/functions.sh
chmod +x submission_reminder_app/config/config.env
chmod +x submission_reminder_app/startup.sh
chmod +x submission_reminder_app/assets/submissions.txt
