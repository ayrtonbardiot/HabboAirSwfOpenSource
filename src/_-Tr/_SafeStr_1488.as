// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Tr._SafeStr_1488

package _-Tr
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1488 implements IMessageParser 
    {

        private var _SafeStr_3973:Vector.<String>;


        public function flush():Boolean
        {
            _SafeStr_3973 = new Vector.<String>(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3973.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }

        public function get collapsedCategories():Vector.<String>
        {
            return (_SafeStr_3973);
        }


    }
}//package _-Tr

// _SafeStr_1488 = "_-ry" (String#10172, DoABC#3)
// _SafeStr_3973 = "_-LU" (String#7975, DoABC#3)


