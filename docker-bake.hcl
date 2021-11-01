# vim: ft=hcl softtabstop=2 tabstop=2 shiftwidth=2 fenc=utf-8 expandtab
# ────────────────────────────────────────────────────────────────────────────────
# [ NOTE ] => clean up buildx builders
# docker buildx ls | awk '$2 ~ /^docker(-container)*$/{print $1}' | xargs -r -I {} docker buildx rm {}
# ────────────────────────────────────────────────────────────────────────────────
# [ NOTE ] create a builder for this file
# docker buildx create --use --name "spacevim" --driver docker-container
# ────────────────────────────────────────────────────────────────────────────────
variable "LOCAL" {default=false}
variable "ARM64" {default=true}
variable "AMD64" {default=true}
group "default" {
  targets = [
    "archlinux",
  ]
}
# LOCAL=true docker buildx bake --builder spacevim archlinux
target "archlinux" {
  context="."
  dockerfile="./contrib/docker/archlinux/Dockerfile"
  tags = ["fjolsvin/spacevim:archlinux"]
  cache-from = ["type=registry,ref=fjolsvin/spacevim:archlinux-cache"]
  cache-to   = ["type=registry,mode=max,ref=fjolsvin/spacevim:archlinux-cache"]
  output     = [equal(LOCAL,true) ? "type=docker" : "type=registry"]
}

