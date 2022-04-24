// by nota

//_-31H._SafeStr_1354

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1354 implements IMessageParser 
    {

        private var _flatId:int;
        private var _SafeStr_7055:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            this._SafeStr_7055 = _arg_1.readBoolean();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get added():Boolean
        {
            return (_SafeStr_7055);
        }


    }
}//package _-31H

// _SafeStr_1354 = "_-d1" (String#9166, DoABC#3)
// _SafeStr_7055 = "_-21p" (String#6653, DoABC#3)


