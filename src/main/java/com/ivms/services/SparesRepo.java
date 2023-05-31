package com.ivms.services;

import com.ivms.entities.Carzspa;

import javax.persistence.*;
import java.util.ArrayList;

public class SparesRepo
{

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("AutoParts");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();


        public void save(Carzspa customer){
            safeTransaction(new Transactor() {
                @Override
                public void transact() {
                    entityManager.persist(customer);
                }
            });
        }

        public ArrayList<Carzspa> listAll(){
            ArrayList<Carzspa> carzspa = new ArrayList<>();
            safeTransaction(new Transactor() {
                @Override
                public void transact() {
                    TypedQuery<Carzspa> query = entityManager.createNamedQuery("Carzspa.fetchAll", Carzspa.class);
                    carzspa.addAll(query.getResultList());
                }
            });

            return carzspa;
        }

        public Carzspa findById(int id){
            Carzspa[] carzspa = new Carzspa[1];
            safeTransaction(new Transactor() {
                @Override
                public void transact() {
                    carzspa[0] = entityManager.find(Carzspa.class, id);
                }
            });

            return carzspa[0];
        }

    public void delete(int id){
        safeTransaction(new Transactor() {
            @Override
            public void transact() {
                Carzspa spares = entityManager.find(Carzspa.class, id);
                if (spares != null) {
                    entityManager.remove(spares);
                    transaction.commit();
                }
            }
        });
    }



    public void update(Carzspa spares)
    {

        safeTransaction(new Transactor() {
            @Override
            public void transact()
            {
                Carzspa update = entityManager.find(Carzspa.class, spares.getId());
                update.setName(spares.getName());
                update.setQuantity(spares.getQuantity());
                update.setCategory(spares.getCategory());
                update.setSellingPrice(spares.getSellingPrice());
                update.setCostPrice(spares.getCostPrice());
                entityManager.merge(update);
            }
        });

    }




    private void start()
    {
        entityManagerFactory = Persistence.createEntityManagerFactory("AutoParts");
        entityManager = entityManagerFactory.createEntityManager();
        transaction   = entityManager.getTransaction();
        }

        private void safeTransaction(Transactor transactor){
            try{
                start();
                transaction.begin();
                transactor.transact();
                transaction.commit();
            }
            catch (Exception e){
                System.out.println(e.getMessage());
            }
            finally {
                if(transaction.isActive())
                {
                    transaction.rollback();
                }
                entityManager.close();
                entityManagerFactory.close();
            }
        }

        @FunctionalInterface
        interface Transactor{
            void transact();
        }

        @Override
        protected void finalize() throws Throwable {
            super.finalize();
        }

}

