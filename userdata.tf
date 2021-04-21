


data "template_file" "tpl" {
for_each = {for object in local.instances: object.name => object}
  template = file("${path.module}/${each.value.userdata}")
  vars = {
    disks = each.value.additional_disks
  logic = file("${path.module}/linuxlogic.sh")
  hostname = each.key
  }
}
