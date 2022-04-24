// by nota

//_-hV._SafeStr_170

package _-hV
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_170 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_170(_arg_1:String, _arg_2:int)
        {
            this._SafeStr_6600.push(_arg_1);
            this._SafeStr_6600.push(_arg_2);
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
}//package _-hV

// _SafeStr_170 = "_-4I" (String#6847, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


