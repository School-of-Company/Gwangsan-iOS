import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LoginFeature.rawValue,
    targets: [
        .implements(module: .feature(.LoginFeature)),
        .testing(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature, type: .interface)
        ]),
        .tests(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature)
        ])
    ]
)
