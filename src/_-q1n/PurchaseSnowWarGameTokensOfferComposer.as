// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1n.PurchaseSnowWarGameTokensOfferComposer

package _-q1n
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    public class PurchaseSnowWarGameTokensOfferComposer implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_3740:Array = [];

        public function PurchaseSnowWarGameTokensOfferComposer(_arg_1:int)
        {
            _SafeStr_3740.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_3740);
        }

        public function dispose():void
        {
            _SafeStr_3740 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_3740 == null);
        }


    }
}//package _-q1n

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


