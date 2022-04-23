// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1395

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1395 implements IMessageParser 
    {

        protected var _ignoredUsers:Array = null;

        public function _SafeStr_1395()
        {
            _ignoredUsers = [];
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _ignoredUsers = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _ignoredUsers.push(_arg_1.readString());
                _local_3++;
            };
            return (true);
        }

        public function get ignoredUsers():Array
        {
            return (_ignoredUsers.slice());
        }


    }
}//package _-NF

// _SafeStr_1395 = "_-V1X" (String#8620, DoABC#3)


