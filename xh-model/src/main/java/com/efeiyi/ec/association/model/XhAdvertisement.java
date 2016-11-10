package com.efeiyi.ec.association.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Administrator on 2016/9/22.
 */
@Entity
@Table(
        name = "advertisement"
)
public class XhAdvertisement {
        private String id;
        private String name;
        private String img;
        private String redirect;
        private Integer adsOrder;
        private String status;
        private String price;
        private String test;
        private String wapRedirect;

        public XhAdvertisement() {
        }

        @Column(
                name = "price"
        )
        public String getPrice() {
            return this.price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        @Id
        @GenericGenerator(
                name = "id",
                strategy = "com.ming800.core.p.model.M8idGenerator"
        )
        @GeneratedValue(
                generator = "id"
        )
        public String getId() {
            return this.id;
        }

        public void setId(String id) {
            this.id = id;
        }

        @Column(
                name = "img"
        )
        public String getImg() {
            return this.img;
        }

        public void setImg(String img) {
            this.img = img;
        }

        @Column(
                name = "redirect"
        )
        public String getRedirect() {
            return this.redirect;
        }

        public void setRedirect(String redirect) {
            this.redirect = redirect;
        }

        @Column(
                name = "name"
        )
        public String getName() {
            return this.name;
        }

        public void setName(String name) {
            this.name = name;
        }

        @Column(
                name = "ads_order"
        )
        public Integer getAdsOrder() {
            return this.adsOrder;
        }

        public void setAdsOrder(Integer adsOrder) {
            this.adsOrder = adsOrder;
        }

        @Column(
                name = "status"
        )
        public String getStatus() {
            return this.status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        @Column(
                name = "group_name"
        )
        public String getTest() {
            return this.test;
        }

        public void setTest(String test) {
            this.test = test;
        }

        @Column(
                name = "wap_redirect"
        )
        public String getWapRedirect() {
            return this.wapRedirect;
        }

        public void setWapRedirect(String wapRedirect) {
            this.wapRedirect = wapRedirect;
        }

        public String toString() {
            return "Advertisement{id = " + this.id + "}";
        }


}
