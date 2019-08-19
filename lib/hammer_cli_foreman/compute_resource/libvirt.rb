module HammerCLIForeman
  module ComputeResources
    class Libvirt < Base
      def name
        'Libvirt'
      end

      def compute_attributes
        [
          ['cpus',   _('Number of CPUs')],
          ['memory', _('String, amount of memory, value in bytes')]
        ]
      end

      def host_attributes
        [
          ['start',  _('Boolean (expressed as 0 or 1), whether to start the machine or not')]
        ]
      end

      def interface_attributes
        [
          ['compute_type',   _('Possible values: %s') % 'bridge, network'],
          ['compute_bridge', _('Name of interface according to type')],
          ['compute_model',  _('Possible values: %s') % 'virtio, rtl8139, ne2k_pci, pcnet, e1000']
        ]
      end

      def volume_attributes
        [
          ['pool_name',   _('One of available storage pools')],
          ['capacity',    _('String value, eg. 10G')],
          ['format_type', _('Possible values: %s') % 'raw, qcow2']
        ]
      end

      def interfaces_attrs_name
        'nics_attributes'
      end

      def mandatory_resource_options
        super + %i[url]
      end
    end

    HammerCLIForeman.register_compute_resource('libvirt', Libvirt.new)
  end
end
