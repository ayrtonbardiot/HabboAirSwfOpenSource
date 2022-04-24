// by nota

//_-wm._SafeStr_1350

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1350 implements IMessageParser 
    {

        private var _SafeStr_7053:int;
        private var _SafeStr_7745:Array;


        public function flush():Boolean
        {
            this._SafeStr_7745 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            this._SafeStr_7053 = _arg_1.readInteger();
            if (this._SafeStr_7053 == 1)
            {
                _local_2 = _arg_1.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    this._SafeStr_7745.push(_arg_1.readInteger());
                    _local_3++;
                };
            };
            return (true);
        }

        public function get errorCode():int
        {
            return (this._SafeStr_7053);
        }

        public function get failedRecipients():Array
        {
            return (this._SafeStr_7745);
        }


    }
}//package _-wm

// _SafeStr_1350 = "_-Ie" (String#7755, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_7745 = "_-ed" (String#9312, DoABC#3)


