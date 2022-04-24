// by nota

//_-n1H._SafeStr_1628

package _-n1H
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1628 implements _SafeStr_1627 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _selected:Boolean;

        public function _SafeStr_1628(_arg_1:IMessageDataWrapper)
        {
            this._SafeStr_4128 = _arg_1.readInteger();
            this._userName = _arg_1.readString();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
        }


    }
}//package _-n1H

// _SafeStr_1627 = "_-k1s" (String#9690, DoABC#3)
// _SafeStr_1628 = "_-m19" (String#9794, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


