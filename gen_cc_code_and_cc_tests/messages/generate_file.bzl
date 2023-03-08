def _generate_file(ctx):
    ctx.actions.expand_template(
        output = ctx.outputs.output_file_name,
        template = ctx.file.template,        
        substitutions = ctx.attr.pattern_dict,
    )
    return DefaultInfo(files = depset([ctx.outputs.output_file_name]))

generate_file = rule(
    implementation = _generate_file,
    attrs = {
        "output_file_name": attr.output(mandatory = True),
        "pattern_dict": attr.string_dict(mandatory = True),
        "template": attr.label(
            doc = "Template file",
            allow_single_file = True,
        ),
    },
)
