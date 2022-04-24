// by nota

package com.sulake.habbo.communication.messages.outgoing.room.furniture;
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ControlYoutubeDisplayPlaybackMessageComposer implements IMessageComposer 
    {

        private var _SafeStr_6600:Array;

        public function ControlYoutubeDisplayPlaybackMessageComposer(_itemId:int, _state:int)
        {
            _SafeStr_6600 = [_itemId, _state];
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }


    }
}//package _-02a

// _SafeStr_422 = "_-HR" (String#7697, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


