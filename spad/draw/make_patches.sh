#!/bin/bash
diff -uwB draw.spad draw+.spad > draw.patch
diff -uwB view2D.spad view2D+.spad > view2D.patch
diff -uwB view3D.spad view3D+.spad > view3D.patch
