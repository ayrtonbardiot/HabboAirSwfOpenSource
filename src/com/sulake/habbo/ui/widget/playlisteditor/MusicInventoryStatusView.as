// by nota

//com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryStatusView

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MusicInventoryStatusView 
    {

        public static const BUY_MORE:String = "MISV_BUY_MORE";
        public static const PREVIEW_PLAYING:String = "MISV_PREVIEW_PLAYING";

        private var _container:_SafeStr_3133;
        private var _SafeStr_6739:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4981:PlayListEditorWidget;
        private var _SafeStr_4494:String;
        private var _SafeStr_6740:ITextWindow;
        private var _SafeStr_6741:ITextWindow;

        public function MusicInventoryStatusView(_arg_1:PlayListEditorWidget, _arg_2:_SafeStr_3133)
        {
            _container = _arg_2;
            _SafeStr_4981 = _arg_1;
            createWindows();
            hide();
        }

        public function destroy():void
        {
            for each (var _local_1:_SafeStr_3133 in _SafeStr_6739.getValues())
            {
                _local_1.destroy();
            };
            _SafeStr_6739 = null;
        }

        public function show():void
        {
            _container.visible = true;
        }

        public function hide():void
        {
            _container.visible = false;
        }

        public function selectView(_arg_1:String):void
        {
            _container.removeChildAt(0);
            _container.addChildAt((_SafeStr_6739[_arg_1] as _SafeStr_3133), 0);
            _SafeStr_4494 = _arg_1;
        }

        public function set songName(_arg_1:String):void
        {
            if (_SafeStr_6740 == null)
            {
                return;
            };
            _SafeStr_6740.text = _arg_1;
        }

        public function set authorName(_arg_1:String):void
        {
            if (_SafeStr_6741 == null)
            {
                return;
            };
            _SafeStr_6741.text = _arg_1;
        }

        public function setPreviewPlayingBackgroundImage(_arg_1:BitmapData, _arg_2:Boolean=true):void
        {
            blitBackgroundImage("MISV_PREVIEW_PLAYING", "preview_play_background_image", _arg_1);
            if (((_arg_2) && (!(_arg_1 == null))))
            {
                _arg_1.dispose();
            };
        }

        public function setGetMoreMusicBackgroundImage(_arg_1:BitmapData, _arg_2:Boolean=true):void
        {
            blitBackgroundImage("MISV_BUY_MORE", "get_more_music_background_image", _arg_1);
            if (((_arg_2) && (!(_arg_1 == null))))
            {
                _arg_1.dispose();
            };
        }

        private function createWindows():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_4:* = null;
            _local_2 = (_SafeStr_4981.assets.getAssetByName("playlisteditor_inventory_subwindow_play_preview") as XmlAsset);
            _local_3 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_3 != null)
            {
                _SafeStr_6739.add("MISV_PREVIEW_PLAYING", _local_3);
                _SafeStr_6740 = (_local_3.getChildByName("preview_play_track_name") as ITextWindow);
                _SafeStr_6741 = (_local_3.getChildByName("preview_play_author_name") as ITextWindow);
                _local_1 = (_local_3.getChildByName("stop_preview_button") as _SafeStr_3122);
                _local_1.addEventListener("WME_CLICK", onStopPreviewClicked);
                setPreviewPlayingBackgroundImage(_SafeStr_4981.getImageGalleryAssetBitmap("background_preview_playing"));
                assignAssetByNameToElement("jb_icon_disc", (_local_3.getChildByName("song_name_icon_bitmap") as _SafeStr_3264));
                assignAssetByNameToElement("jb_icon_composer", (_local_3.getChildByName("author_name_icon_bitmap") as _SafeStr_3264));
            };
            _local_2 = (_SafeStr_4981.assets.getAssetByName("playlisteditor_inventory_subwindow_get_more_music") as XmlAsset);
            _local_3 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_3 != null)
            {
                _SafeStr_6739.add("MISV_BUY_MORE", _local_3);
                _local_4 = (_local_3.getChildByName("open_catalog_button") as _SafeStr_3122);
                _local_4.addEventListener("WME_CLICK", onOpenCatalogButtonClicked);
                setGetMoreMusicBackgroundImage(_SafeStr_4981.getImageGalleryAssetBitmap("background_get_more_music"));
            };
        }

        private function blitBackgroundImage(_arg_1:String, _arg_2:String, _arg_3:BitmapData):void
        {
            var _local_5:* = null;
            var _local_6:_SafeStr_3133 = (_SafeStr_6739[_arg_1] as _SafeStr_3133);
            if (_local_6 == null)
            {
                return;
            };
            var _local_4:_SafeStr_3264 = (_local_6.getChildByName(_arg_2) as _SafeStr_3264);
            if (_local_4 == null)
            {
                return;
            };
            if (_arg_3 != null)
            {
                _local_5 = new BitmapData(_local_4.width, _local_4.height, false, 0xFFFFFFFF);
                _local_5.copyPixels(_arg_3, _arg_3.rect, new Point(0, 0));
                _local_4.bitmap = _local_5;
            };
        }

        private function assignAssetByNameToElement(_arg_1:String, _arg_2:_SafeStr_3264):void
        {
            var _local_3:* = null;
            var _local_4:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_4 != null)
            {
                if (((!(_arg_2 == null)) && (!(_local_4.content == null))))
                {
                    _local_3 = (_local_4.content as BitmapData);
                    _arg_2.bitmap = _local_3.clone();
                };
            };
        }

        private function onOpenCatalogButtonClicked(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.openSongDiskShopCataloguePage();
        }

        private function onStopPreviewClicked(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.stopUserSong();
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4494 = "_-LI" (String#1588, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6739 = "_-027" (String#3420, DoABC#4)
// _SafeStr_6740 = "_-dK" (String#14563, DoABC#4)
// _SafeStr_6741 = "_-R12" (String#14071, DoABC#4)


