# Configure HyperV
provider "hyperv" {
  user            = "Administator"
  password        = "P@ssw0rd"
  host            = "127.0.0.1"
  port            = 5986
  https           = true
  insecure        = false
  use_ntlm        = true
#   tls_server_name = ""
#   cacert_path     = ""
#   cert_path       = ""
#   key_path        = ""
  script_path     = "C:/Temp/terraform_%RAND%.cmd"
  timeout         = "30s"
}

# Create a switch
resource "hyperv_network_switch" "dmz" {
}

# Create a vhd
resource "hyperv_vhd" "webserver" {
}

# Create a machine
resource "hyperv_machine_instance" "webserver" {
}

resource "hyperv_machine_instance" "default" {
  name = "WebServer"
  generation = 1
  automatic_critical_error_action = "Pause"
  automatic_critical_error_action_timeout = 30
  automatic_start_action = "StartIfRunning"
  automatic_start_delay = 0
  automatic_stop_action = "Save"
  checkpoint_type = "Production"
  dynamic_memory = false
  guest_controlled_cache_types = false
  high_memory_mapped_io_space = 536870912
  lock_on_disconnect = "Off"
  low_memory_mapped_io_space = 134217728
  memory_maximum_bytes = 1099511627776
  memory_minimum_bytes = 536870912
  memory_startup_bytes = 536870912
  notes = ""
  processor_count = 1
  smart_paging_file_path = "C:\ProgramData\Microsoft\Windows\Hyper-V"
  snapshot_file_location = "C:\ProgramData\Microsoft\Windows\Hyper-V"
  static_memory = true
  state = "Running"

  # Configure integration services
  integration_services {
  }

  # Create a network adaptor
  network_adaptors {
  }

  # Create dvd drive
  dvd_drives {
  }

  # Create a hard disk drive
  hard_disk_drives {
  }
}

#this ressource type will be skipped if the VM generation is 1
resource "hyperv_machine_instance" "default" {
  name = "WebServer"
  vm_firmware {
    enable_secure_boot = ""
    secure_boot_template = ""
    secure_boot_template_id = ""
    preferred_network_boot_protocol = ""
    console_mode = ""
    pause_after_boot_failure = ""
  }
}