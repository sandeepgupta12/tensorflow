"""Provides the repository macro to import StableHLO."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    # LINT.IfChange
    STABLEHLO_COMMIT = "ca13d31b5ed0b2053dde0a624480ad765e219ebf"
    STABLEHLO_SHA256 = "123462093f087f2576bb6a6cc471370eed2d43c291f881ff359fd4ca812003db"
    # LINT.ThenChange(Google-internal path)

    tf_http_archive(
        name = "stablehlo",
        sha256 = STABLEHLO_SHA256,
        strip_prefix = "stablehlo-{commit}".format(commit = STABLEHLO_COMMIT),
        urls = tf_mirror_urls("https://github.com/openxla/stablehlo/archive/{commit}.zip".format(commit = STABLEHLO_COMMIT)),
        patch_file = [
            "//third_party/stablehlo:temporary.patch",  # Autogenerated, don't remove.
        ],
    )
