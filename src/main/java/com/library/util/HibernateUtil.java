package com.library.util;

import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;

public class HibernateUtil {
	
	private static SessionFactory sessionFactory;

    static {
        try {
            sessionFactory =new Configuration().configure().buildSessionFactory();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}
