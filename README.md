# ILGPU IR Snapshots

Reference IR snapshots used to validate the ILGPU compiler's intermediate
representation across its optimization and backend pipeline.

## Relationship to ILGPU

This repository is consumed as a **git submodule** by
[ILGPU](https://github.com/m4rs-mt/ILGPU), mounted at:

```
Src/ILGPUC.Tests/Snapshots
```

The ILGPU test suite compares freshly-produced IR against the `.il` files in
this repo to detect regressions in frontend lowering, optimizer passes, and
backend transforms. The comparison is driven by:

- `Src/ILGPUC.Tests/Framework/IRSnapshotVerifier.cs` — loads the expected
  `.il` file for a given dump point and asserts byte-equivalence with the
  actual compiler output.
- `Src/ILGPUC.Tests/Framework/CompilationTestBase.cs` — exposes the dump
  points and wires tests into the verifier.

## Layout

Top-level directories correspond to points in the ILGPU compilation pipeline:

| Directory                          | Dump point                                                                 |
| ---------------------------------- | -------------------------------------------------------------------------- |
| `AfterFrontend/`                   | IR immediately after frontend lowering                                     |
| `AfterGlobalOpt/`                  | IR after global/module-level optimization passes                           |
| `AfterBackendTransforms/<Target>/` | Per-target IR after backend transforms (`Cuda`, `Metal`, `OpenCL`, `ROCm`) |

Snapshot filenames follow the pattern:

```
<KernelClass>.<KernelMethod>[.<TypeArgs>][.<OptLevel>][.<CompilationMode>].il
```

For example:

```
AfterBackendTransforms/Metal/BinaryIntOpKernels.AddKernel.UInt16.O2.Debug.il
```

## Regenerating snapshots

When an intentional ILGPU change alters the emitted IR, regenerate the
snapshots from the ILGPU checkout by running the test suite with the update
flag:

```bash
ILGPU_UPDATE_IR=1 dotnet test Src/ILGPUC.Tests
```

The verifier writes the updated `.il` files directly into this submodule's
working tree. Review the diff, then commit and push from within the submodule
and update the pinned SHA in the ILGPU superproject.

## Bootstrapping

From a fresh ILGPU clone:

```bash
git submodule update --init Src/ILGPUC.Tests/Snapshots
```

If the `Snapshots/` directory exists but is empty, the submodule has not been
initialized and `IRSnapshotVerifier` will fail with a clear error pointing to
the command above.
