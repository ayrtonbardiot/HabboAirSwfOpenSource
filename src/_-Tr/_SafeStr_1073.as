// by nota

//_-Tr._SafeStr_1073

package _-Tr
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1654;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1073 implements IMessageParser 
    {

        private var _SafeStr_7563:Vector.<_SafeStr_1654>;


        public function flush():Boolean
        {
            _SafeStr_7563 = new Vector.<_SafeStr_1654>(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7563.push(new _SafeStr_1654(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get topLevelContexts():Vector.<_SafeStr_1654>
        {
            return (_SafeStr_7563);
        }


    }
}//package _-Tr

// _SafeStr_1073 = "_-b14" (String#9039, DoABC#3)
// _SafeStr_1654 = "_-91u" (String#7177, DoABC#3)
// _SafeStr_7563 = "_-QW" (String#8322, DoABC#3)


