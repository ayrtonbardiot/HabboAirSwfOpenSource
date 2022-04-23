// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Tr._SafeStr_1182

package _-Tr
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1598;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1182 implements IMessageParser 
    {

        private var _SafeStr_4707:Vector.<_SafeStr_1598>;


        public function flush():Boolean
        {
            _SafeStr_4707 = new Vector.<_SafeStr_1598>(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4707.push(new _SafeStr_1598(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get savedSearches():Vector.<_SafeStr_1598>
        {
            return (_SafeStr_4707);
        }


    }
}//package _-Tr

// _SafeStr_1182 = "_-Gn" (String#7643, DoABC#3)
// _SafeStr_1598 = "_-UP" (String#8579, DoABC#3)
// _SafeStr_4707 = "_-F1z" (String#7559, DoABC#3)


