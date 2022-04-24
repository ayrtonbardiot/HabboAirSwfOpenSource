// by nota

//_-XO._SafeStr_627

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_627 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_627(_arg_1:int)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(1);
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-XO

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_627 = "_-8Q" (String#7128, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


