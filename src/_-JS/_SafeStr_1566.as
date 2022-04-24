// by nota

//_-JS._SafeStr_1566

package _-JS
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1566 
    {

        private var _SafeStr_4579:int;
        private var _SafeStr_7053:int;

        public function _SafeStr_1566(_arg_1:IMessageDataWrapper)
        {
            this._SafeStr_4579 = _arg_1.readInteger();
            this._SafeStr_7053 = _arg_1.readInteger();
        }

        public function get senderId():int
        {
            return (this._SafeStr_4579);
        }

        public function get errorCode():int
        {
            return (this._SafeStr_7053);
        }


    }
}//package _-JS

// _SafeStr_1566 = "_-O1O" (String#8142, DoABC#3)
// _SafeStr_4579 = "_-021" (String#6500, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


