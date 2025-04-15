# Set the DEBIAN_FRONTEND to noninteractive to avoid prompts
#export DEBIAN_FRONTEND=noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update package lists
sudo apt-get update -y

# Install utilities
sudo apt-get install dialog apt-utils -y

# Install Nginx
sudo apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

# Define an array of welcome messages
MESSAGES=(
    "Hello from your web application!"
    "Welcome to the nginx server!"
    "Thanks for visiting our web app!"
    "Greetings from the cloud!"
    "Your web application is running successfully!"
)

# Get a random message from the array
RANDOM_INDEX=$((RANDOM % ${#MESSAGES[@]}))
SELECTED_MESSAGE="${MESSAGES[$RANDOM_INDEX]}"

# Create a simple HTML file with the random message
echo "$SELECTED_MESSAGE" | sudo tee /var/www/html/index.html