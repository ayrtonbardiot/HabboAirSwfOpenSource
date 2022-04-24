// by nota

//_-2s._SafeStr_996

package _-2s
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_996 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_996(_arg_1:Array, _arg_2:Boolean, _arg_3:int, _arg_4:String)
        {
            var _local_5:int;
            super();
            this._SafeStr_6600.push(_arg_1.length);
            _local_5 = 0;
            while (_local_5 < _arg_1.length)
            {
                this._SafeStr_6600.push(_arg_1[_local_5]);
                _local_5++;
            };
            this._SafeStr_6600.push(_arg_2);
            this._SafeStr_6600.push(_arg_3);
            this._SafeStr_6600.push(_arg_4);
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
}//package _-2s

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_996 = "_-V16" (String#8603, DoABC#3)


