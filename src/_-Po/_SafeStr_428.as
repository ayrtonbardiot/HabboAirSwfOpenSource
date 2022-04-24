// by nota

//_-Po._SafeStr_428

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_428 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_428(_arg_1:int)
        {
            this._SafeStr_6600.push(_arg_1);
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
}//package _-Po

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_428 = "_-5Z" (String#6920, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


