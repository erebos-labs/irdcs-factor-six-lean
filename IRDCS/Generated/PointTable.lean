import IRDCS.Generated.GridData
namespace IRDCS.Generated
deriving instance DecidableEq for ClosedBin
def pointTable : List ℤ := [572, 314, 85, -111, -245, -370, -503, -634, -767, -900, -1033, -1163, -1264, -1360, -1394, -1424, -1424, -1392, -1327, -1223, -1090, -894, -633, -437, -275, -147, -44, 59, 160, 226, 226, 160, 59, -44, -147, -275, -437, -633, -894, -1090, -1223, -1327, -1392, -1424, -1424, -1394, -1360, -1264, -1163, -1033, -900, -767, -634, -503, -370, -245, -111, 85, 314, 572]
theorem bins_as_uniform : bins = (List.range 60).map
    (fun j : ℕ => (⟨⟨j, 60⟩, ⟨(j : ℤ) + 1, 60⟩, pointTable.getD j 0⟩ : ClosedBin)) := by decide
end IRDCS.Generated
