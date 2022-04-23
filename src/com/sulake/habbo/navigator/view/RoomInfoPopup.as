// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.view.RoomInfoPopup

package com.sulake.habbo.navigator.view
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import __AS3__.vec.Vector;
    import _-Ja._SafeStr_1569;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import _-M1k._SafeStr_725;
    import _-M1k._SafeStr_994;
    import _-M1k._SafeStr_928;

    public class RoomInfoPopup 
    {

        private var _window:_SafeStr_3133;
        private var _navigator:HabboNewNavigator;
        private var _SafeStr_6500:Vector.<String> = new Vector.<String>(0);
        private var _SafeStr_6495:_SafeStr_1569 = null;
        private var _lastWindowPosition:Point = new Point(-1, -1);
        private var _SafeStr_6496:Boolean = false;
        private var _SafeStr_6497:Boolean;
        private var _SafeStr_6498:Boolean = false;
        private var _SafeStr_6499:Boolean;

        public function RoomInfoPopup(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function show(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (!_window)
                {
                    createWindow();
                };
                populate();
                _window.visible = true;
                _SafeStr_6496 = false;
                _SafeStr_6498 = false;
            }
            else
            {
                if (_window)
                {
                    _window.visible = false;
                };
            };
        }

        public function get visible():Boolean
        {
            if (!_window)
            {
                return (false);
            };
            return (_window.visible);
        }

        public function showAt(_arg_1:Boolean, _arg_2:int, _arg_3:int):void
        {
            var _local_5:* = null;
            var _local_4:* = (!(this.visible));
            show(_arg_1);
            if (_arg_1)
            {
                _local_5 = new Point(_arg_2, (_arg_3 - (_window.height / 2)));
                if (_lastWindowPosition != _local_5)
                {
                    if ((((_local_4) && (_arg_1)) && (_SafeStr_6495)))
                    {
                        _navigator.trackEventLog("browse.openroominfo", "Results", _SafeStr_6495.roomName, _SafeStr_6495.flatId);
                    };
                };
                position = _local_5;
                _window.activate();
            };
        }

        public function setData(_arg_1:_SafeStr_1569):void
        {
            this._SafeStr_6495 = _arg_1;
        }

        public function getGlobalRectangle(_arg_1:Rectangle):void
        {
            _window.getGlobalRectangle(_arg_1);
        }

        private function set position(_arg_1:Point):void
        {
            _window.position = _arg_1;
            _lastWindowPosition = _arg_1;
        }

        private function get roomIsHome():Boolean
        {
            if (_SafeStr_6496)
            {
                return (_SafeStr_6497);
            };
            return (_navigator.legacyNavigator.isRoomHome(_SafeStr_6495.flatId));
        }

        private function set roomIsHome(_arg_1:Boolean):void
        {
            _SafeStr_6496 = true;
            _SafeStr_6497 = _arg_1;
        }

        private function get roomIsFavorite():Boolean
        {
            if (_SafeStr_6498)
            {
                return (_SafeStr_6499);
            };
            return (_navigator.legacyNavigator.isRoomFavorite(_SafeStr_6495.flatId));
        }

        private function set roomIsFavorite(_arg_1:Boolean):void
        {
            _SafeStr_6498 = true;
            _SafeStr_6499 = _arg_1;
        }

        private function populate():void
        {
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_1:* = null;
            var _local_10:int;
            if (_SafeStr_6495 == null)
            {
                return;
            };
            var _local_4:IItemListWindow = IItemListWindow(_window.findChildByName("main_content"));
            var _local_9:IItemListWindow = IItemListWindow(_window.findChildByName("header_content"));
            var _local_6:IItemListWindow = IItemListWindow(_window.findChildByName("bottom_itemlist"));
            _window.findChildByName("room_owner_region").visible = _SafeStr_6495.showOwner;
            _window.findChildByName("room_group_region").visible = (!(_SafeStr_6495.groupBadgeCode == ""));
            _window.findChildByName("room_name").caption = _SafeStr_6495.roomName;
            _window.findChildByName("room_desc").caption = _SafeStr_6495.description;
            _window.findChildByName("owner_name").caption = _SafeStr_6495.ownerName;
            _window.findChildByName("room_owner_region").id = _SafeStr_6495.ownerId;
            _window.findChildByName("room_owner_region").procedure = ownerLinkProcedure;
            _window.findChildByName("favorite_region").procedure = roomFavoriteRegionProcedure;
            _window.findChildByName("home_region").procedure = homeRoomRegionProcedure;
            _window.findChildByName("settings_region").procedure = settingsRegionProcedure;
            _window.findChildByName("settings_container").visible = (_SafeStr_6495.ownerName == _navigator.sessionData.userName);
            if (((_navigator.context.configuration.getBoolean("room.report.enabled")) && (!(_SafeStr_6495.ownerName == _navigator.sessionData.userName))))
            {
                _window.findChildByName("report_region").id = _SafeStr_6495.ownerId;
                _window.findChildByName("report_region").procedure = reportRegionProcedure;
                _window.findChildByName("report_region").visible = true;
                _window.findChildByName("report_container").visible = true;
            }
            else
            {
                _window.findChildByName("report_region").visible = false;
                _window.findChildByName("report_container").visible = false;
            };
            IItemListWindow(_window.findChildByName("midBottom_itemlist")).arrangeListItems();
            IStaticBitmapWrapperWindow(_window.findChildByName("favorite_icon")).assetUri = ("newnavigator_icon_fav_" + ((roomIsFavorite) ? "yes" : "no"));
            IStaticBitmapWrapperWindow(_window.findChildByName("home_icon")).assetUri = ("newnavigator_icon_home_" + ((roomIsHome) ? "yes" : "no"));
            var _local_8:* = (!(_SafeStr_6495.groupBadgeCode == ""));
            _window.findChildByName("room_group_badge").visible = _local_8;
            _window.findChildByName("room_owner_region").visible = _SafeStr_6495.showOwner;
            _window.findChildByName("room_group_region").visible = _local_8;
            _window.findChildByName("room_group_owner_container").visible = ((_local_8) || (_SafeStr_6495.showOwner));
            if (_local_8)
            {
                _SafeStr_3349(_SafeStr_3199(_window.findChildByName("room_group_badge")).widget).badgeId = _SafeStr_6495.groupBadgeCode;
                _window.findChildByName("group_name").caption = _SafeStr_6495.groupName;
                _window.findChildByName("group_name").id = _SafeStr_6495.habboGroupId;
                _window.findChildByName("room_group_region").id = _SafeStr_6495.habboGroupId;
                _window.findChildByName("room_group_region").procedure = groupLinkProcedure;
                _local_7 = _navigator.getCachedGroupDetails(_SafeStr_6495.habboGroupId);
                if (_local_7)
                {
                    if (_local_7.isOwner)
                    {
                        IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_owner";
                    }
                    else
                    {
                        if (_local_7.isAdmin)
                        {
                            IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = "newnavigator_icon_group_admin";
                        }
                        else
                        {
                            IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = null;
                        };
                    };
                    IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_size")).assetUri = (("${image.library.url}guilds/grouptype_icon_" + _local_7.type) + ".png");
                    IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_furnish")).assetUri = ((_local_7.membersCanDecorate) ? "${image.library.url}guilds/group_decorate_icon.png" : null);
                };
            }
            else
            {
                IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_admin")).assetUri = null;
                IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_size")).assetUri = null;
                IStaticBitmapWrapperWindow(_window.findChildByName("group_mode_furnish")).assetUri = null;
            };
            var _local_3:* = (_SafeStr_6495.roomAdExpiresInMin > 0);
            if (_local_3)
            {
                _local_5 = ((_navigator.localization.getLocalizationWithParams("navigator.eventsettings.name") + ": ") + _SafeStr_6495.roomAdName);
                _local_1 = (((_navigator.localization.getLocalizationWithParams("navigator.eventsettings.desc") + ": ") + _SafeStr_6495.roomAdDescription) + "\n");
                _local_1 = (_local_1 + (_navigator.localization.getLocalizationWithParams("roomad.event.expiration_time") + FriendlyTime.getFriendlyTime(_navigator.localization, (_SafeStr_6495.roomAdExpiresInMin * 60))));
                _window.findChildByName("event_name").caption = _local_5;
                _window.findChildByName("event_desc").caption = _local_1;
            };
            _local_6.getListItemByName("event_info").visible = _local_3;
            _local_9.arrangeListItems();
            _SafeStr_6500 = new Vector.<String>(0);
            var _local_2:IItemListWindow = IItemListWindow(_window.findChildByName("tag_list"));
            _local_2.destroyListItems();
            _local_10 = 0;
            while (_local_10 < _SafeStr_6495.tags.length)
            {
                _SafeStr_6500.push(_SafeStr_6495.tags[_local_10]);
                _local_2.addListItem(getNewTagItem(_SafeStr_6495.tags[_local_10], _local_10));
                _local_10++;
            };
            clearProperties();
            addProperty("properties", "${navigator.roompopup.property.trading}", RoomTradingLevelEnum.getLocalizationKey(_SafeStr_6495.tradeMode));
            if (_navigator.context.configuration.getBoolean("room.ranking.enabled"))
            {
                addProperty("properties", "${navigator.roompopup.property.ranking}", _SafeStr_6495.ranking.toString());
            };
            addProperty("properties", "${navigator.roompopup.property.max_users}", _SafeStr_6495.maxUserCount.toString());
            IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = "newnavigator_default_room";
            if (_navigator.sessionData.isPerkAllowed("NAVIGATOR_ROOM_THUMBNAIL_CAMERA"))
            {
                if (_SafeStr_6495.officialRoomPicRef != null)
                {
                    if (_navigator.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
                    {
                        IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = ((_navigator.getProperty("navigator.thumbnail.url_base") + _SafeStr_6495.flatId) + ".png");
                    }
                    else
                    {
                        IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = (_navigator.getProperty("image.library.url") + _SafeStr_6495.officialRoomPicRef);
                    };
                }
                else
                {
                    IStaticBitmapWrapperWindow(_window.findChildByName("room_thumbnail")).assetUri = ((_navigator.getProperty("navigator.thumbnail.url_base") + _SafeStr_6495.flatId) + ".png");
                };
            };
            _local_6.arrangeListItems();
            _local_4.arrangeListItems();
        }

        private function clearProperties():void
        {
            IItemListWindow(_window.findChildByName("properties")).destroyListItems();
        }

        private function addProperty(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_5:IItemListWindow = IItemListWindow(_window.findChildByName(_arg_1));
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("property_xml").content)));
            _local_4.findChildByName("property_name").caption = _arg_2;
            _local_4.findChildByName("property_value").caption = _arg_3;
            _local_5.addListItem(_local_4);
        }

        private function getNewTagItem(_arg_1:String, _arg_2:int):_SafeStr_3109
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("tag_xml").content)));
            var _local_4:IRegionWindow = IRegionWindow(_local_3.findChildByName("tag_region"));
            _local_4.id = _arg_2;
            _local_4.procedure = tagRegionProcedure;
            _local_4.findChildByName("tag_text").caption = ("#" + _arg_1);
            return (_local_4);
        }

        private function createWindow():void
        {
            _window = _SafeStr_3133(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("room_info_popup_bubble_xml").content)));
        }

        private function ownerLinkProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.getExtendedProfile(_arg_2.id);
                destroy();
            };
        }

        private function groupLinkProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.getGuildInfo(_arg_2.id);
                destroy();
            };
        }

        private function reportRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.habboHelp.reportRoom(_SafeStr_6495.flatId, _SafeStr_6495.roomName, _SafeStr_6495.description);
                destroy();
            };
        }

        private function tagRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.performTagSearch(_SafeStr_6500[_arg_2.id]);
                destroy();
            };
        }

        private function settingsRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl;
                _local_3.startRoomSettingsEditFromNavigator(_SafeStr_6495.flatId, _SafeStr_6495.habboGroupId);
                destroy();
            };
        }

        private function roomFavoriteRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (!roomIsFavorite)
                {
                    _navigator.communication.connection.send(new _SafeStr_725(_SafeStr_6495.flatId));
                    roomIsFavorite = true;
                }
                else
                {
                    _navigator.communication.connection.send(new _SafeStr_994(_SafeStr_6495.flatId));
                    roomIsFavorite = false;
                };
                IStaticBitmapWrapperWindow(_window.findChildByName("favorite_icon")).assetUri = ("newnavigator_icon_fav_" + ((roomIsFavorite) ? "yes" : "no"));
            };
        }

        private function homeRoomRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (!roomIsHome)
                {
                    _navigator.communication.connection.send(new _SafeStr_928(_SafeStr_6495.flatId));
                    roomIsHome = true;
                };
                IStaticBitmapWrapperWindow(_window.findChildByName("home_icon")).assetUri = ("newnavigator_icon_home_" + ((roomIsHome) ? "yes" : "no"));
            };
        }

        private function destroy():void
        {
            if (_window)
            {
                _window.destroy();
            };
            _window = null;
        }


    }
}//package com.sulake.habbo.navigator.view

// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_6495 = "_-n1A" (String#1948, DoABC#4)
// _SafeStr_6496 = "_-m1p" (String#13598, DoABC#4)
// _SafeStr_6497 = "_-t1U" (String#18652, DoABC#4)
// _SafeStr_6498 = "_-a16" (String#12762, DoABC#4)
// _SafeStr_6499 = "_-I1X" (String#18896, DoABC#4)
// _SafeStr_6500 = "_-Xc" (String#11222, DoABC#4)
// _SafeStr_725 = "_-11Z" (String#10180, DoABC#4)
// _SafeStr_928 = "_-F1C" (String#18672, DoABC#4)
// _SafeStr_994 = "_-K4" (String#9037, DoABC#4)


