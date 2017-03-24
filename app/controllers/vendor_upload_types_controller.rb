class VendorUploadTypesController < InheritedResources::Base

  private

    def vendor_upload_type_params
      params.require(:vendor_upload_type).permit(:name)
    end
end

