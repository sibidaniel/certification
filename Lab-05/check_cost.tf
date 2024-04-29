data "local_file" "main" {
 filename = "${path.module}/test.txt"
}
output "name" {
  value = data.local_file.main.content
}
output "max" {
  value = max(2,3,4)
}