class ApplicationController < ActionController::API
    def render_record_errors(record, status = :unprocessable_entity)
        render_errors(record.errors.to_hash(true), status)
    end
    
    def render_errors(errors, status = :unprocessable_entity)
        render json: {
          ok: false,
          status: Rack::Utils.status_code(status),
          errors: errors
        }, status: status
    end
    
    def render_error_message(error_message, status = :unprocessable_entity)
        render json: {
          ok: false,
          status: Rack::Utils.status_code(status),
          error_message: error_message
        }, status: status
    end
end
