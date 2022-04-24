// by nota

//_-31H._SafeStr_1424

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1424 implements IMessageParser 
    {

        private var _SafeStr_7060:int;
        private var _SafeStr_4736:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7060 = _arg_1.readInteger();
            this._SafeStr_4736 = _arg_1.readBoolean();
            return (true);
        }

        public function get rating():int
        {
            return (_SafeStr_7060);
        }

        public function get canRate():Boolean
        {
            return (_SafeStr_4736);
        }


    }
}//package _-31H

// _SafeStr_1424 = "_-RL" (String#8373, DoABC#3)
// _SafeStr_4736 = "_-A5" (String#7239, DoABC#3)
// _SafeStr_7060 = "_-02C" (String#6505, DoABC#3)


