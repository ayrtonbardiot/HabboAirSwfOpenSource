// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a1d._SafeStr_1362

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1362 implements IMessageParser 
    {

        private var _SafeStr_7136:Vector.<_SafeStr_1534> = new Vector.<_SafeStr_1534>(0);


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7136.push(new _SafeStr_1534(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7136 = new Vector.<_SafeStr_1534>(0);
            return (true);
        }

        public function get ingredients():Vector.<_SafeStr_1534>
        {
            return (_SafeStr_7136);
        }


    }
}//package _-a1d

// _SafeStr_1362 = "_-u1E" (String#10309, DoABC#3)
// _SafeStr_1534 = "_-k1q" (String#9688, DoABC#3)
// _SafeStr_7136 = "_-E1k" (String#7480, DoABC#3)


