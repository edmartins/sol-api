require 'rails_helper'

RSpec.describe Notifications::ProposalImports::Lots::Error, type: [:service, :notification] do
  let(:resource) do
    create(:lot_proposal_import, bidding: bidding, provider: provider)
  end
  let(:lot) { resource.lot }
  let(:args) { { lot_proposal_import: resource, supplier: user } }
  let(:extra_args) { { bidding_id: bidding.id, lot_id: lot.id }.as_json }
  let(:title_msg) { 'Proposta não importada.' }
  let(:body_args) { [lot.name, resource.file.filename] }
  let(:body_msg) do
    "Não foi possível realizar a importação da proposta do lote \"#{lot.name}\"."\
    " Verifique o arquivo <strong>proposal_upload_1_1.xls</strong> e tente novamente."
  end

  include_examples 'services/concerns/proposal_import_notification', 'lot_error'
end
