// by nota

//com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class TraxPreviewCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _soundManager:_SafeStr_2088;
        private var _playButton:_SafeStr_3122;
        private var _SafeStr_6891:int = -1;

        public function TraxPreviewCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_2088)
        {
            super(_arg_1);
            _playButton = (_window.findChildByName("listen") as _SafeStr_3122);
            _SafeStr_14.log(("Trax listener found button: " + _playButton));
            if (_playButton != null)
            {
                _playButton.addEventListener("WME_CLICK", onClickPlay);
                _playButton.disable();
            };
            _soundManager = _arg_2;
        }

        override public function dispose():void
        {
            if (_playButton != null)
            {
                _playButton.removeEventListener("WME_CLICK", onClickPlay);
            };
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                _soundManager.musicController.stop(3);
                _soundManager = null;
            };
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            if (page.offers.length == 0)
            {
                return (false);
            };
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            return (true);
        }

        override public function closed():void
        {
            super.closed();
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                _soundManager.musicController.stop(3);
            };
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            if (((_arg_1 == null) || (_arg_1.offer == null)))
            {
                return;
            };
            var _local_3:Boolean;
            var _local_2:_SafeStr_3151 = _arg_1.offer.product;
            if (_local_2.extraParam.length > 0)
            {
                _SafeStr_6891 = parseInt(_local_2.extraParam);
                _local_3 = true;
            };
            if (_playButton != null)
            {
                if (_local_3)
                {
                    _playButton.enable();
                }
                else
                {
                    _playButton.disable();
                };
            };
        }

        private function onClickPlay(_arg_1:WindowMouseEvent):void
        {
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                forceNoFadeoutOnPlayingSong(0);
                forceNoFadeoutOnPlayingSong(3);
                _soundManager.musicController.playSong(_SafeStr_6891, 3, 15, 40, 0, 2);
            };
        }

        private function forceNoFadeoutOnPlayingSong(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:int = _soundManager.musicController.getSongIdPlayingAtPriority(_arg_1);
            if (_local_3 != -1)
            {
                _local_2 = _soundManager.musicController.getSongInfo(_local_3);
                if (_local_2.soundObject != null)
                {
                    _local_2.soundObject.fadeOutSeconds = 0;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_6891 = "_-z1o" (String#4669, DoABC#4)


