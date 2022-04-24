// by nota

//_-wm._SafeStr_1166

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1166 implements IMessageParser 
    {

        private var _SafeStr_7741:int;
        private var _SafeStr_7053:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7741 = _arg_1.readInteger();
            this._SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }

        public function get clientMessageId():int
        {
            return (this._SafeStr_7741);
        }

        public function get errorCode():int
        {
            return (this._SafeStr_7053);
        }


    }
}//package _-wm

// _SafeStr_1166 = "_-d1D" (String#9175, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_7741 = "_-51A" (String#6875, DoABC#3)


