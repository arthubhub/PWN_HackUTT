# Disable ASLR
sudo echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

# Enable ASLR
sudo echo 2 | sudo tee /proc/sys/kernel/randomize_va_space