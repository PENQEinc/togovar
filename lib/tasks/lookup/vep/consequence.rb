module Consequence
  def parse_consequences(str)
    return {} if str.blank? || str == '-'
    str.split(',').map { |x| cns_to_id(x) }.compact
  end

  def display_consequence(str)
    return nil if str.blank? || str == '-'
    str[0].upcase + str[1..-1].tr('_', ' ')
  end

  def cns_to_id(str)
    return nil if str.blank? || str == '-'

    v = case str
          when 'transcript_ablation'
            'SO:0001893'
          when 'splice_acceptor_variant'
            'SO:0001574'
          when 'splice_donor_variant'
            'SO:0001575'
          when 'stop_gained'
            'SO:0001587'
          when 'frameshift_variant'
            'SO:0001589'
          when 'stop_lost'
            'SO:0001578'
          when 'start_lost'
            'SO:0002012'
          when 'transcript_amplification'
            'SO:0001889'
          when 'inframe_insertion'
            'SO:0001821'
          when 'inframe_deletion'
            'SO:0001822'
          when 'missense_variant'
            'SO:0001583'
          when 'protein_altering_variant'
            'SO:0001818'
          when 'splice_region_variant'
            'SO:0001630'
          when 'incomplete_terminal_codon_variant'
            'SO:0001626'
          when 'stop_retained_variant'
            'SO:0001567'
          when 'synonymous_variant'
            'SO:0001819'
          when 'coding_sequence_variant'
            'SO:0001580'
          when 'mature_miRNA_variant'
            'SO:0001620'
          when '5_prime_UTR_variant'
            'SO:0001623'
          when '3_prime_UTR_variant'
            'SO:0001624'
          when 'non_coding_transcript_exon_variant'
            'SO:0001792'
          when 'intron_variant'
            'SO:0001627'
          when 'NMD_transcript_variant'
            'SO:0001621'
          when 'non_coding_transcript_variant'
            'SO:0001619'
          when 'upstream_gene_variant'
            'SO:0001631'
          when 'downstream_gene_variant'
            'SO:0001632'
          when 'TFBS_ablation'
            'SO:0001895'
          when 'TFBS_amplification'
            'SO:0001892'
          when 'TF_binding_site_variant'
            'SO:0001782'
          when 'regulatory_region_ablation'
            'SO:0001894'
          when 'regulatory_region_amplification'
            'SO:0001891'
          when 'feature_elongation'
            'SO:0001907'
          when 'regulatory_region_variant'
            'SO:0001566'
          when 'feature_truncation'
            'SO:0001906'
          when 'intergenic_variant'
            'SO:0001628'
          when 'start_retained_variant' # not in Ensemble
            'SO_0002019'
          else
            raise ParseError("Unsupported consequence type: #{str}")
        end
    Hash[%w[id label].zip([v, display_consequence(str)])]
  end

  class ParseError < StandardError; end
end