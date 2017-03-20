class VendorUploadsController < InheritedResources::Base

  private

    def vendor_upload_params
      params.require(:vendor_upload).permit(:vendor_id, :upload, :vendor_upload_type_id, :expiration_date, :name, :notes)
    end
end

