#!/bin/sh

declare -a libs_arr=("MDBCommon" "MDBCommonUI" "MDBNetworking" "MDBDataLayer" "MDBModels" "MDBUtilities" "MDBServices")
declare -a modules_arr=("MDBMain")

mockolo_path=mockolo
arch_name="$(uname -m)"

if [ "$(echo "$arch_name")" = "arm64" ]; then
  mockolo_path=/opt/homebrew/bin/mockolo
fi

        $mockolo_path -s "$PROJECT_DIR/MovieDB/Sources/Packages/Libraries/MDBNetworking" -d "$PROJECT_DIR/MovieDB/Sources/Packages/Libraries/MDBNetworking/Tests/MDBNetworkingMocks/MockoloMocks.swift" -i "MDBNetworking"
        
# mockolo
if which $mockolo_path >/dev/null; then
    $mockolo_path -s "$PROJECT_DIR/MovieDB/Sources/App/" -s "$PROJECT_DIR/MovieDB/Sources/Utilities/" -d "$PROJECT_DIR/Tests/MovieDBTests/Mocks/MockoloMocks.swift"

for i in "${libs_arr[@]}"; do
	    $mockolo_path -s "$PROJECT_DIR/MovieDB/Sources/Packages/Libraries/$i" -d "$PROJECT_DIR/MovieDB/Sources/Packages/Libraries/$i/Tests/${i}Mocks/MockoloMocks.swift" -i $i
done

for i in "${modules_arr[@]}"; do
        $mockolo_path -s "$PROJECT_DIR/MovieDB/Sources/Packages/Modules/$i" -d "$PROJECT_DIR/MovieDB/Sources/Packages/Modules/$i/Tests/${i}Mocks/MockoloMocks.swift" -i $i
done

else
    echo "warning: mockolo not installed, download from https://github.com/uber/mockolo"
fi
