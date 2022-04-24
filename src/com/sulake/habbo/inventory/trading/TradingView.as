// by nota

//com.sulake.habbo.inventory.trading.TradingView

package com.sulake.habbo.inventory.trading
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.inventory.ItemPopupCtrl;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-61W._SafeStr_665;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.display.BitmapData;
    import com.sulake.habbo.inventory.items.CreditTradingItem;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.habbo.sound.ISongInfo;
    import flash.events.TimerEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;

    public class TradingView implements IInventoryView, _SafeStr_3140 
    {

        private static const COLOR_LOCKED:uint = 4284532064;
        private static const COLOR_UNLOCKED:uint = 2577770;
        public static const ALERT_SCAM:int = 0;
        public static const ALERT_OTHER_CANCELLED:int = 1;
        public static const ALERT_ALREADY_OPEN:int = 2;

        private var _SafeStr_6324:TradingModel;
        private var _windowManager:_SafeStr_1695;
        private var _localization:_SafeStr_18;
        private var _roomEngine:IRoomEngine;
        private var _SafeStr_3745:_SafeStr_21;
        private var _SafeStr_6326:ItemPopupCtrl;
        private var _soundManager:_SafeStr_2088;
        private var _disposed:Boolean = false;
        private var _SafeStr_4426:Boolean;
        private var _SafeStr_6325:_SafeStr_3133;
        private var _windowMin:_SafeStr_3133;
        private var _SafeStr_4582:Timer;
        private var _selection:GroupItem;
        private var _SafeStr_5538:Boolean;
        private var _waitingSongInfo:Array = [];

        public function TradingView(_arg_1:TradingModel, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:IRoomEngine, _arg_5:_SafeStr_18, _arg_6:_SafeStr_2088)
        {
            _SafeStr_6324 = _arg_1;
            _windowManager = _arg_2;
            _localization = _arg_5;
            _SafeStr_3745 = _arg_3;
            _roomEngine = _arg_4;
            _soundManager = _arg_6;
            _SafeStr_4426 = false;
            var _local_8:IAsset = _SafeStr_3745.getAssetByName("item_popup_xml");
            var _local_7:XmlAsset = XmlAsset(_local_8);
            var _local_9:_SafeStr_3133 = (_windowManager.buildFromXML((_local_7.content as XML)) as _SafeStr_3133);
            _local_9.visible = false;
            _SafeStr_6326 = new ItemPopupCtrl(_local_9, _SafeStr_3745, _windowManager, _SafeStr_6324);
            _soundManager.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (((_SafeStr_6325) && (!(_SafeStr_6325.disposed))))
                {
                    _SafeStr_6325.dispose();
                    _SafeStr_6325 = null;
                };
                if (_SafeStr_4582)
                {
                    _SafeStr_4582.removeEventListener("timer", timerEventHandler);
                    _SafeStr_4582.stop();
                    _SafeStr_4582 = null;
                };
                if (_SafeStr_6326 != null)
                {
                    _SafeStr_6326.dispose();
                    _SafeStr_6326 = null;
                };
                if (_soundManager)
                {
                    if (_soundManager.events != null)
                    {
                        _soundManager.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
                    };
                    _soundManager = null;
                };
                _waitingSongInfo = null;
                _SafeStr_6324 = null;
                _windowManager = null;
                _roomEngine = null;
                _localization = null;
                _SafeStr_3745 = null;
                _selection = null;
                _SafeStr_4426 = false;
                _disposed = true;
            };
        }

        public function setup(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:Boolean):void
        {
            setMinimized(false);
            hideOwnUserNotification();
            hideOtherUserNotification();
            if (((!(_arg_2)) && (!(_arg_4))))
            {
                showInfoMessage("${inventory.trading.warning.both_accounts_disabled}");
                showOwnUserNotification("");
                showOtherUserNotification("");
            }
            else
            {
                if (!_arg_2)
                {
                    showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
                };
                if (!_arg_4)
                {
                    showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
                };
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            if (_SafeStr_6325 == null)
            {
                _SafeStr_6325 = createNormalWindow();
                showHighlightInfo(null);
            };
            if (_windowMin == null)
            {
                _windowMin = createMinimizedWindow();
            };
            if (!_SafeStr_5538)
            {
                return (_SafeStr_6325);
            };
            return (_windowMin);
        }

        public function setMinimized(_arg_1:Boolean=false):void
        {
            _SafeStr_5538 = _arg_1;
        }

        public function updateItemList(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            if (!_SafeStr_6325)
            {
                return;
            };
            var _local_8:uint;
            var _local_11:* = (_arg_1 == _SafeStr_6324.otherUserId);
            var _local_10:_SafeStr_24 = ((_local_11) ? _SafeStr_6324.otherUserItems : _SafeStr_6324.ownUserItems);
            var _local_6:IItemGridWindow = ((_local_11) ? getOtherUsersItemGrid() : getOwnUsersItemGrid());
            while (_local_8 < _local_10.length)
            {
                _local_3 = (_local_10.getWithIndex(_local_8) as GroupItem);
                _local_9 = (_local_6.getGridItemAt(_local_8) as _SafeStr_3133);
                if (_local_9)
                {
                    _local_9.id = _local_8;
                    while (_local_9.numChildren > 0)
                    {
                        _local_9.removeChildAt(0);
                    };
                    _local_9.addChild(_local_3.window);
                    _local_3.window.id = _local_8;
                    _local_3.removeIntervalProcedure();
                };
                _local_8++;
            };
            while (_local_8 < _local_6.numGridItems)
            {
                _local_9 = (_local_6.getGridItemAt(_local_8) as _SafeStr_3133);
                if (_local_9)
                {
                    _local_9.id = _local_8;
                    _local_9.removeChildAt(0);
                    _local_9.invalidate();
                };
                _local_8++;
            };
            updateActionState();
        }

        public function clearItemLists():void
        {
            var _local_3:* = null;
            var _local_2:uint;
            var _local_1:* = null;
            _local_1 = getOwnUsersItemGrid();
            _local_2 = 0;
            while (_local_2 < _local_1.numGridItems)
            {
                _local_3 = (_local_1.getGridItemAt(_local_2) as _SafeStr_3133);
                if (_local_3)
                {
                    _local_3.id = _local_2;
                    _local_3.removeChildAt(0);
                };
                _local_2++;
            };
            _local_1 = getOtherUsersItemGrid();
            _local_2 = 0;
            while (_local_2 < _local_1.numGridItems)
            {
                _local_3 = (_local_1.getGridItemAt(_local_2) as _SafeStr_3133);
                if (_local_3)
                {
                    _local_3.id = _local_2;
                    _local_3.removeChildAt(0);
                };
                _local_2++;
            };
        }

        public function updateUserInterface():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_1:* = null;
            if (_SafeStr_6325)
            {
                updateActionState();
                _local_3 = (_SafeStr_6325.findChildByTag("OTHER_USER_NAME") as ITextWindow);
                if (_local_3)
                {
                    _local_3.text = _SafeStr_6324.otherUserName;
                };
                _SafeStr_6325.findChildByTag("OWN_USER_ACCEPTED").visible = _SafeStr_6324.ownUserAccepts;
                _local_2 = (_SafeStr_6325.findChildByTag("OWN_USER_LOCK") as IStaticBitmapWrapperWindow);
                if (_local_2)
                {
                    _local_2.assetUri = ((_SafeStr_6324.ownUserAccepts) ? "talent_locked_achievement" : "inventory_trading_trading_unlocked_icon");
                };
                _SafeStr_6325.findChildByTag("OTHER_USER_ACCEPTED").visible = _SafeStr_6324.otherUserAccepts;
                _local_2 = (_SafeStr_6325.findChildByTag("OTHER_USER_LOCK") as IStaticBitmapWrapperWindow);
                if (_local_2)
                {
                    _local_2.assetUri = ((_SafeStr_6324.otherUserAccepts) ? "talent_locked_achievement" : "inventory_trading_trading_unlocked_icon");
                };
            };
        }

        public function updateActionState():void
        {
            var _local_1:* = null;
            if (_SafeStr_6325)
            {
                _local_1 = _SafeStr_6325.findChildByName("button_accept");
                if (!_local_1)
                {
                    return;
                };
                if (_SafeStr_6324.getInventory().getBoolean("trading.warning.enabled"))
                {
                    if (_SafeStr_6324.isCreditFurniPresent())
                    {
                        showHighlightInfo(_localization.getLocalization("inventory.trading.warning.credits", "inventory.trading.warning.credits"));
                    }
                    else
                    {
                        showHighlightInfo(null);
                    };
                };
                showOwnOfferInfo(_SafeStr_6324.ownUserNumItems, _SafeStr_6324.ownUserNumCredits);
                showOtherOfferInfo(_SafeStr_6324.otherUserNumItems, _SafeStr_6324.otherUserNumCredits);
                switch (_SafeStr_6324.state)
                {
                    case 0:
                        if (((_SafeStr_6324.otherUserItems.length > 0) || (_SafeStr_6324.ownUserItems.length > 0)))
                        {
                            _local_1.enable();
                        }
                        else
                        {
                            _local_1.disable();
                        };
                        _local_1.caption = "${inventory.trading.accept}";
                        return;
                    case 1:
                        if (((_SafeStr_6324.otherUserItems.length > 0) || (_SafeStr_6324.ownUserItems.length > 0)))
                        {
                            _local_1.enable();
                        }
                        else
                        {
                            _local_1.disable();
                        };
                        _local_1.caption = ((_SafeStr_6324.ownUserAccepts) ? "${inventory.trading.modify}" : "${inventory.trading.accept}");
                        showInfoMessage("${inventory.trading.info.add}");
                        return;
                    case 2:
                        _local_1.disable();
                        _local_1.caption = "${inventory.trading.countdown}";
                        showInfoMessage("${inventory.trading.info.confirm}");
                        return;
                    case 3:
                        _local_1.enable();
                        _local_1.caption = "${inventory.trading.confirm}";
                        showInfoMessage("${inventory.trading.info.confirm}");
                        return;
                    case 4:
                        _local_1.disable();
                        showInfoMessage("${inventory.trading.info.waiting}");
                        return;
                    case 5:
                        _local_1.disable();
                        _local_1.caption = "${inventory.trading.accept}";
                        showInfoMessage("${inventory.trading.info.confirm}");
                        return;
                    case 6:
                        return;
                    default:
                        throw (new Error((('Unknown trading progress state: "' + _SafeStr_6324.state) + '"')));
                };
            };
        }

        public function showInfoMessage(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_SafeStr_6325.findChildByName("help_text") as ITextWindow);
            _local_2.text = _arg_1;
            _local_2.visible = true;
        }

        private function showHighlightInfo(_arg_1:String):void
        {
            if (!_SafeStr_6325)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _SafeStr_6325.findChildByName("info_border_highlighted");
            if (_local_3)
            {
                _local_3.visible = (!(_arg_1 == null));
            };
            var _local_2:ITextWindow = (_SafeStr_6325.findChildByName("info_text_highlighted") as ITextWindow);
            if (_local_2)
            {
                _local_2.visible = (!(_arg_1 == null));
                if (_arg_1)
                {
                    _local_2.text = _arg_1;
                };
            };
        }

        private function showOwnOfferInfo(_arg_1:int, _arg_2:int):void
        {
            showOfferInfo("content_text_1_a", _arg_1, "content_text_1_b", _arg_2, true);
        }

        private function showOtherOfferInfo(_arg_1:int, _arg_2:int):void
        {
            showOfferInfo("content_text_2_a", _arg_1, "content_text_2_b", _arg_2, false);
        }

        private function showOfferInfo(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:* = null;
            if (!_SafeStr_6324.getInventory().getBoolean("trading.warning.enabled"))
            {
                return;
            };
            _local_6 = (_SafeStr_6325.findChildByName(_arg_1) as ITextWindow);
            if (_local_6)
            {
                _localization.registerParameter("inventory.trading.info.itemcount", "value", _arg_2.toString());
                _local_6.text = _localization.getLocalization("inventory.trading.info.itemcount");
            };
            _local_6 = (_SafeStr_6325.findChildByName(_arg_3) as ITextWindow);
            if (_local_6)
            {
                if (_arg_5)
                {
                    _localization.registerParameter("inventory.trading.info.creditvalue.own", "value", _arg_4.toString());
                    _local_6.text = _localization.getLocalization("inventory.trading.info.creditvalue.own");
                }
                else
                {
                    _localization.registerParameter("inventory.trading.info.creditvalue", "value", _arg_4.toString());
                    _local_6.text = _localization.getLocalization("inventory.trading.info.creditvalue");
                };
            };
        }

        public function showOwnUserNotification(_arg_1:String):void
        {
            var _local_3:ITextWindow = (_SafeStr_6325.findChildByName("info_text_0") as ITextWindow);
            _local_3.text = _arg_1;
            _local_3.visible = true;
            var _local_2:IItemGridWindow = (_SafeStr_6325.findChildByName("item_grid_0") as IItemGridWindow);
            if (_local_2)
            {
                _local_2.visible = false;
            };
        }

        public function hideOwnUserNotification():void
        {
            var _local_2:ITextWindow = (_SafeStr_6325.findChildByName("info_text_0") as ITextWindow);
            _local_2.visible = false;
            var _local_1:IItemGridWindow = (_SafeStr_6325.findChildByName("item_grid_0") as IItemGridWindow);
            if (_local_1)
            {
                _local_1.visible = true;
            };
        }

        public function showOtherUserNotification(_arg_1:String):void
        {
            var _local_3:ITextWindow = (_SafeStr_6325.findChildByName("info_text_1") as ITextWindow);
            _local_3.text = _arg_1;
            _local_3.visible = true;
            var _local_2:IItemGridWindow = (_SafeStr_6325.findChildByName("item_grid_1") as IItemGridWindow);
            if (_local_2)
            {
                _local_2.visible = false;
            };
        }

        public function hideOtherUserNotification():void
        {
            var _local_2:ITextWindow = (_SafeStr_6325.findChildByName("info_text_1") as ITextWindow);
            _local_2.visible = false;
            var _local_1:IItemGridWindow = (_SafeStr_6325.findChildByName("item_grid_1") as IItemGridWindow);
            if (_local_1)
            {
                _local_1.visible = true;
            };
        }

        public function alertTradeOpenFailed(_arg_1:_SafeStr_665):void
        {
            var _local_2:String = ("inventory.trading.openfail." + _arg_1.getParser().reason);
            _windowManager.registerLocalizationParameter(_local_2, "otherusername", _arg_1.getParser().otherUserName);
            _windowManager.simpleAlert("${inventory.trading.openfail.title}", "${inventory.trading.openfail.caption}", (("${" + _local_2) + "}"));
        }

        public function alertPopup(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 0:
                    _windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.warning.other_not_offering}", 0, onTradingAlert);
                    return;
                case 1:
                    _windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.info.closed}", 0, onTradingAlert);
                    return;
                case 2:
                    _windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.info.already_open}", 0, onTradingAlert);
                default:
            };
        }

        public function showAlertNotification(_arg_1:String, _arg_2:String, _arg_3:Function):void
        {
            var title = _arg_1;
            var description = _arg_2;
            var callback = _arg_3;
            _windowManager.alert(title, description, 0, ((callback != null) ? callback : function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
{
    _arg_1.dispose();
}));
        }

        public function startConfirmCountdown():void
        {
            if (_SafeStr_4582 == null)
            {
                _SafeStr_4582 = new Timer(1000, 3);
                _SafeStr_4582.addEventListener("timer", timerEventHandler);
            };
            _SafeStr_4582.reset();
            _SafeStr_4582.repeatCount = 3;
            _SafeStr_4582.start();
            _windowManager.registerLocalizationParameter("inventory.trading.countdown", "counter", "3");
            updateUserInterface();
        }

        public function cancelConfirmCountdown():void
        {
            if (_SafeStr_4582 != null)
            {
                _SafeStr_4582.reset();
            };
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:Boolean;
            var _local_5:uint;
            _local_6 = _SafeStr_6324.ownUserItems;
            _local_3 = false;
            _local_5 = 0;
            while (_local_5 < _local_6.length)
            {
                _local_4 = (_local_6.getWithIndex(_local_5) as GroupItem);
                if (_local_4.iconCallbackId == _arg_1)
                {
                    _local_4.iconImage = _arg_2;
                    _local_3 = true;
                };
                _local_5++;
            };
            if (_local_3)
            {
                updateItemList(_SafeStr_6324.ownUserId);
            };
            _local_6 = _SafeStr_6324.otherUserItems;
            _local_3 = false;
            _local_5 = 0;
            while (_local_5 < _local_6.length)
            {
                _local_4 = (_local_6[_local_5] as GroupItem);
                if (_local_4.iconCallbackId == _arg_1)
                {
                    _local_4.iconImage = _arg_2;
                    _local_3 = true;
                };
                _local_5++;
            };
            if (_local_3)
            {
                updateItemList(_SafeStr_6324.otherUserId);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function setSelection(_arg_1:GroupItem):void
        {
            removeSelection();
            if (_arg_1)
            {
                _selection = _arg_1;
                _selection.isSelected = true;
            };
        }

        public function removeSelection():void
        {
            if (_selection)
            {
                _selection.isSelected = false;
                _selection = null;
            };
        }

        public function updateItemImage(_arg_1:int, _arg_2:BitmapData):void
        {
        }

        public function onTradingAlert(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (_arg_2.type == "WE_OK")
            {
                _arg_1.dispose();
            };
        }

        protected function getOwnUsersItemGrid():IItemGridWindow
        {
            return (_SafeStr_6325.findChildByTag("OWN_USER_GRID") as IItemGridWindow);
        }

        protected function getOtherUsersItemGrid():IItemGridWindow
        {
            return (_SafeStr_6325.findChildByTag("OTHER_USER_GRID") as IItemGridWindow);
        }

        protected function resolveItemThumbnail(_arg_1:GroupItem):BitmapData
        {
            var _local_3:* = null;
            var _local_2:BitmapData = _arg_1.iconImage;
            if (_local_2 == null)
            {
                if (_arg_1.isWallItem)
                {
                    _local_3 = _roomEngine.getWallItemIcon(_arg_1.type, this, _arg_1.stuffData.getLegacyString());
                }
                else
                {
                    _local_3 = _roomEngine.getFurnitureIcon(_arg_1.type, this, null, _arg_1.stuffData);
                };
                if (_local_3.id > 0)
                {
                    _arg_1.iconCallbackId = _local_3.id;
                };
                _local_2 = _local_3.data;
                _arg_1.iconImage = _local_2;
            };
            return (_local_2);
        }

        protected function createThumbnailContainer():_SafeStr_3133
        {
            var _local_1:XML = (XmlAsset(_SafeStr_3745.getAssetByName("inventory_thumb_xml")).content as XML);
            return (_windowManager.buildFromXML(_local_1) as _SafeStr_3133);
        }

        protected function selectOwnTradeItem(_arg_1:uint):void
        {
            var _local_2:* = null;
            if (((_SafeStr_6324 == null) || (_SafeStr_6324.ownUserItems == null)))
            {
                return;
            };
            if (_arg_1 < _SafeStr_6324.ownUserItems.length)
            {
                _local_2 = (_SafeStr_6324.ownUserItems.getWithIndex(_arg_1) as GroupItem);
                setSelection(_local_2);
                if (_local_2)
                {
                    _SafeStr_6324.getFurniInventoryModel().displayItemInfo(_local_2);
                };
            };
        }

        protected function selectOthersTradeItem(_arg_1:uint):void
        {
            var _local_2:* = null;
            if (((_SafeStr_6324 == null) || (_SafeStr_6324.otherUserItems == null)))
            {
                return;
            };
            if (_arg_1 < _SafeStr_6324.otherUserItems.length)
            {
                _local_2 = (_SafeStr_6324.otherUserItems.getWithIndex(_arg_1) as GroupItem);
                setSelection(_local_2);
                if (_local_2)
                {
                    _SafeStr_6324.getFurniInventoryModel().displayItemInfo(_local_2);
                };
            };
        }

        private function createNormalWindow():_SafeStr_3133
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:uint;
            var _local_4:* = null;
            var _local_1:XML = (XmlAsset(_SafeStr_3745.getAssetByName("inventory_trading_xml")).content as XML);
            var _local_6:_SafeStr_3133 = (_windowManager.buildFromXML(_local_1) as _SafeStr_3133);
            _local_4 = (_local_6.findChildByTag("OWN_USER_GRID") as IItemGridWindow);
            _local_5 = 0;
            while (_local_5 < _local_4.numGridItems)
            {
                _local_2 = _local_4.getGridItemAt(_local_5);
                _local_2.id = _local_5;
                _local_2.procedure = ownThumbEventProc;
                _local_2.addEventListener("WME_OVER", ownThumbEventProc);
                _local_2.addEventListener("WME_OUT", ownThumbEventProc);
                _local_5++;
            };
            _local_4 = (_local_6.findChildByTag("OTHER_USER_GRID") as IItemGridWindow);
            _local_5 = 0;
            while (_local_5 < _local_4.numGridItems)
            {
                _local_2 = _local_4.getGridItemAt(_local_5);
                _local_2.id = _local_5;
                _local_2.procedure = othersThumbEventProc;
                _local_2.addEventListener("WME_OVER", othersThumbEventProc);
                _local_2.addEventListener("WME_OUT", othersThumbEventProc);
                _local_5++;
            };
            _local_6.procedure = windowEventProc;
            return (_local_6);
        }

        private function createMinimizedWindow():_SafeStr_3133
        {
            var _local_1:XML = (XmlAsset(_SafeStr_3745.getAssetByName("inventory_trading_minimized_xml")).content as XML);
            var _local_2:_SafeStr_3133 = (_windowManager.buildFromXML(_local_1) as _SafeStr_3133);
            _local_2.procedure = windowMininizedEventProc;
            return (_local_2);
        }

        private function windowMininizedEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_continue":
                        _SafeStr_6324.requestFurniViewOpen();
                        return;
                    case "button_cancel":
                        _SafeStr_6324.requestCancelTrading();
                        return;
                };
            };
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_accept":
                        switch (_SafeStr_6324.state)
                        {
                            case 1:
                                if (((_SafeStr_6324.otherUserItems.length == 0) && (!(_SafeStr_6324.ownUserAccepts))))
                                {
                                    alertPopup(0);
                                };
                                if (_SafeStr_6324.ownUserAccepts)
                                {
                                    _SafeStr_6324.requestUnacceptTrading();
                                }
                                else
                                {
                                    _SafeStr_6324.requestAcceptTrading();
                                };
                                break;
                            case 3:
                                _arg_2.disable();
                                _SafeStr_6324.requestConfirmAcceptTrading();
                            default:
                        };
                        return;
                    case "button_cancel":
                        switch (_SafeStr_6324.state)
                        {
                            case 1:
                                _SafeStr_6324.requestCancelTrading();
                                break;
                            case 3:
                                _SafeStr_6324.requestConfirmDeclineTrading();
                            default:
                        };
                        return;
                };
            };
        }

        private function ownThumbEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            thumbEventProc(_arg_1, _arg_2, true);
        }

        private function othersThumbEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            thumbEventProc(_arg_1, _arg_2, false);
        }

        private function thumbEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109, _arg_3:Boolean):void
        {
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_10:* = null;
            var _local_9:* = null;
            if (((_arg_3) && (_arg_1.type == "WME_CLICK")))
            {
                _SafeStr_6324.requestRemoveItemFromTrading(_arg_2.id);
            };
            if (_arg_1.type == "WME_OVER")
            {
                if (_arg_3)
                {
                    _local_8 = _SafeStr_6324.ownUserItems.getWithIndex(_arg_2.id);
                }
                else
                {
                    _local_8 = _SafeStr_6324.otherUserItems.getWithIndex(_arg_2.id);
                };
                if (_local_8 == null)
                {
                    return;
                };
                _local_4 = (_local_8 as CreditTradingItem);
                if (((!(_local_4 == null)) && (!(_arg_3))))
                {
                    _SafeStr_6326.updateContent((_arg_2 as _SafeStr_3133), _local_4.getItemTooltipText(), _local_4.getItemIcon(), null, 2, false);
                    _SafeStr_6326.show();
                    return;
                };
                _local_5 = _local_8.peek();
                if (_local_5 == null)
                {
                    return;
                };
                _local_6 = _SafeStr_6324.getItemImage(_local_5);
                if (!_local_5.isWallItem)
                {
                    _local_7 = (("${roomItem.name." + _local_5.type) + "}");
                }
                else
                {
                    _local_7 = (("${wallItem.name." + _local_5.type) + "}");
                };
                if (_local_5.category == 6)
                {
                    _local_7 = (("${poster_" + _local_5.stuffData.getLegacyString()) + "_name}");
                };
                if (_local_5.category == 10)
                {
                    _local_10 = (_local_5 as FurnitureItem);
                    _local_9 = new Date(_local_10.creationYear, (_local_10.creationMonth - 1), _local_10.creationDay);
                    _local_7 = ((_localization.getLocalization(("roomItem.name." + _local_5.type)) + " ") + _local_9.toLocaleDateString());
                };
                if (_local_5.category == 8)
                {
                    _local_7 = getTraxSongFurniName(_local_8, _local_7, true, _arg_2.id, _arg_3);
                };
                _SafeStr_6326.updateContent((_arg_2 as _SafeStr_3133), _local_7, _local_6, _local_8.peek().stuffData, 2, isExternalImagetype(_local_5));
                _SafeStr_6326.show();
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    _SafeStr_6326.hideDelayed();
                };
            };
        }

        private function isExternalImagetype(_arg_1:FurnitureItem):Boolean
        {
            if (!_SafeStr_6324.getInventory())
            {
                return (false);
            };
            var _local_2:_SafeStr_3130 = _SafeStr_6324.getInventory().getFurnitureData(_arg_1.type, "i");
            return ((_local_2) && (_local_2.isExternalImageType));
        }

        private function getTraxSongFurniName(_arg_1:GroupItem, _arg_2:String, _arg_3:Boolean, _arg_4:int=-1, _arg_5:Boolean=false):String
        {
            var _local_6:_SafeStr_3154 = _arg_1.peek();
            var _local_7:ISongInfo = _soundManager.musicController.getSongInfo(_local_6.extra);
            if (_local_7 != null)
            {
                _localization.registerParameter("songdisc.info", "name", _local_7.name);
                _localization.registerParameter("songdisc.info", "author", _local_7.creator);
                _arg_2 = _localization.getLocalization("songdisc.info");
            }
            else
            {
                if (_arg_3)
                {
                    if (_waitingSongInfo.length > 0)
                    {
                        _waitingSongInfo.pop();
                        _waitingSongInfo.pop();
                        _waitingSongInfo.pop();
                    };
                    _waitingSongInfo.push(_arg_4);
                    _waitingSongInfo.push(_arg_1);
                    _waitingSongInfo.push(_arg_5);
                    _soundManager.musicController.requestSongInfoWithoutSamples(_local_6.extra);
                };
            };
            return (_arg_2);
        }

        private function timerEventHandler(_arg_1:TimerEvent):void
        {
            _windowManager.registerLocalizationParameter("inventory.trading.countdown", "counter", String((3 - _SafeStr_4582.currentCount)));
            if (_SafeStr_4582.currentCount == 3)
            {
                _SafeStr_6324.confirmCountdownReady();
                _SafeStr_4582.reset();
            };
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            var _local_8:Boolean;
            var _local_6:* = null;
            var _local_7:uint;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            if (_waitingSongInfo.length > 0)
            {
                _local_8 = _waitingSongInfo.pop();
                _local_6 = _waitingSongInfo.pop();
                _local_7 = _waitingSongInfo.pop();
                _local_3 = _local_6.peek();
                if (_local_3.extra == _arg_1.id)
                {
                    if ((((_local_8) && (_SafeStr_6324.ownUserItems.getWithIndex(_local_7) == _local_6)) || ((!(_local_8)) && (_SafeStr_6324.otherUserItems.getWithIndex(_local_7) == _local_6))))
                    {
                        _local_4 = getTraxSongFurniName(_local_6, "", false);
                        _local_5 = _SafeStr_6324.getItemImage(_local_3);
                        _local_2 = ((_local_8) ? getOwnUsersItemGrid().getGridItemAt(_local_7) : getOtherUsersItemGrid().getGridItemAt(_local_7));
                        _SafeStr_6326.updateContent((_local_2 as _SafeStr_3133), _local_4, _local_5);
                    };
                }
                else
                {
                    _waitingSongInfo.push(_local_7);
                    _waitingSongInfo.push(_local_6);
                    _waitingSongInfo.push(_local_8);
                };
            };
        }


    }
}//package com.sulake.habbo.inventory.trading

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_6324 = "_-h13" (String#1373, DoABC#4)
// _SafeStr_6325 = "_-Oj" (String#2454, DoABC#4)
// _SafeStr_6326 = "_-qC" (String#5622, DoABC#4)
// _SafeStr_665 = "_-r12" (String#10679, DoABC#4)


